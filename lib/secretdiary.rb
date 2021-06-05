# frozen_string_literal: true

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

  def add_entry(message)
    raise 'It is locked!' if @locked

    @page.add_entry(message)
  end

  def read_entries
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

  def read_entries
    @messages
  end
end
