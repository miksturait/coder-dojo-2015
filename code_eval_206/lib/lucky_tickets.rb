class LuckyTickets

  def initialize(number)
    @number = number
  end

  def count_lucky_tickets
    range.map { |num| num.to_s.rjust(@number, "0") }.count do |number|
      Tickets.new(number).is_lucky_ticket?
    end
  end

  def range
    ending_range = ("9" * @number).to_i
    0..ending_range
  end
end

class Tickets

  def initialize(ticket)
    @ticket = ticket.to_s.split('').map(&:to_i)
    # @@cache = { }
  end

  def is_lucky_ticket?
    # left_part = @ticket.take(@ticket.length/2).sort
    # right_part = @ticket.drop(@ticket.length/2).sort
    # @@cache[left_part] ||= left_part.reduce(:+)
    # @@cache[right_part] ||= right_part.reduce(:+)
    # @@cache[left_part] == @@cache[right_part]
  @ticket.take(@ticket.length/2).reduce(:+) == @ticket.drop(@ticket.length/2).reduce(:+)
  end
end


