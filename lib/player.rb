# frozen_string_literal: false

# Contains the current position on the board of a player's chess pieces
class Player
  attr_reader :positions

  def initialize(color)
    case color
    when 'W'
      @positions = { R1: 'a1', N1: 'b1', B1: 'c1', Q1: 'd1', K1: 'e1', B2: 'f1', N2: 'g1', R2: 'h1',
                     P1: 'a2', P2: 'b2', P3: 'c2', P4: 'd2', P5: 'e2', P6: 'f2', P7: 'g2', P8: 'h2' }
    when 'B'
      @positions = { R1: 'a8', N1: 'b8', B1: 'c8', Q1: 'd8', K1: 'e8', B2: 'f8', N2: 'g8', R2: 'h8',
                     P1: 'a7', P2: 'b7', P3: 'c7', P4: 'd7', P5: 'e7', P6: 'f7', P7: 'g7', P8: 'h7' }
    end
  end
end
