class SecretDiary
  
  def initialize
    @locked = true
  end

  def add_entry(message) # only allow calling add_entry if unlocked
    raise 'It is locked!' if locked?

    @message = message
  end

  def get_entries # only allow calling get_entries if unlocked
    raise 'It is locked!' if locked?

    @message
  end

  def unlock
    @locked = false
  end

  def lock
    @locked = true
  end

  private

  def locked?
    @locked == true
  end

end

class Pages
  def add_entries(message)
    @message = message
  end

  def get_entries
    @message
  end
end