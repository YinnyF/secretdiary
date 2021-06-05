class SecretDiary
  
  def initialize(page = Page.new)
    @locked = true
    @page = page
  end

  def unlock
    @locked = false
  end

  def lock
    @locked = true
  end

  def add_entry(message) # only allow calling add_entry on pages if unlocked
    raise 'It is locked!' if @locked

    @page.add_entry(message)
  end

  def get_entries # only allow calling get_entries on pages if unlocked
    raise 'It is locked!' if @locked

    @page.get_entries
  end

end

class Page
  def initialize
    @messages = []
  end

  def add_entry(message)
    @messages << message
  end

  def get_entries
    @messages
  end
end