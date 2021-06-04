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

## TODO

Reorganise into classes with high cohesion:
* Use Forwarding (OOP) - using a member of an object results in actually using the corresponding member of a different object: the use is forwarded to another object.
The forwarding object is frequently called a wrapper object. 

Understand how to TDD this?
