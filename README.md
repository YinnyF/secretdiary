# secretdiary

A Makers Week 2 practical: Object Oriented Code 1, Encapsulation & Cohesion


* **Languages used**: Ruby
* **Testing frameworks**: RSpec

## Objective
* Encapsulate program behaviour into cohesive classes.

## Exercise

### Cohesion

Each class should have one purpose or job, sometimes referred to as its responsibility.

A class has high cohesion when everything inside of it relates to that purpose, without anything extraneous. Perfection is achieved when there is nothing left to take away.

**Test-drive** the secret diary example:

```
SecretDiary
  - lock
  - unlock
  - add_entry
  - get_entries

Initially the `SecretDiary` class is locked, meaning `add_entry` and `get_entries` should throw an error.

When the user calls `unlock`, `add_entry` and `get_entries` should work as desired.

When the user locks the diary, by calling `lock`, `add_entry` and `get_entries` should, again, throw an error.
```

**First** organise it into one class only.

**Then**, when all your tests are green, reorganise it into classes with high cohesion.

This will also involve reorganising your tests!

## Approach

1. First I created the `SecretDiary` class with all the methods (please see first commit for ./lib/secretdiary.rb).

2. I planned to separate the locking methods from the reading/writing methods to obtain high cohesion.

3. I wanted to understand how to separate these methods into separate classes whilst still making the secretdiary work as intended.
    * I did not want to expose the `@locked` instance variable to `attr_reader` or `attr_writer` for obvious reasons.
    * The diary would need to know whether it is locked or not in order to read/write. 

4. I started by TDD'ing a new class called `Page` which took the responsibility of reading/writing messages inside the diary. Then whenever `SecretDiary` needed to read/write a page, the responsibility would be given to `Page`. A new instance of `Page` would be created when instantiating the `SecretDiary`.

> Forwarding (OOP): using a member of an object results in actually using the corresponding member of a different object: the use is forwarded to another object. The forwarding object is frequently called a wrapper object. 

5. Now, I need to ensure that `SecretDiary` is tested independently, because if we then wanted to extend the functionality of reading/writing messages in `Pages` to include more than one message, then all the tests would break. We can 'inject' an instance of `Pages` into `SecretDiary` via the initializer. Then use doubles to test the `SecretDiary` class.

> Dependency injection is a technique for helping you test classes in isolation. It allows a class to use either its real dependency, or a double.

6. So then, I created a double to stand in for an instance of `Page` class. I commented out the Page class and checked that the tests for `SecretDiary` passed and it did. 

N.B. For simplicity, the `SecretDiary` and `Page` classes live in one ruby file, and the unit tests for both classes are in one rspec spec file.