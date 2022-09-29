# frozen_string_literal: false

require_relative '../lib/moves'

describe Moves do
  subject(:moves) { described_class.new }

  describe '#square_to_coord' do
    context 'when square "a1" is given' do
      it 'returns coordinates [0, 0]' do
        result = moves.square_to_coord('a1')
        expect(result).to eq([0, 0])
      end
    end
  end

  describe '#square_to_coord' do
    context 'when square "d5" is given' do
      it 'returns coordinates [3, 4]' do
        result = moves.square_to_coord('d5')
        expect(result).to eq([3, 4])
      end
    end
  end

  describe '#coord_to_square' do
    context 'when coordinates [8, 8] are given' do
      it 'returns square "h8"' do
        result = moves.coord_to_square([7, 7])
        expect(result).to eq('h8')
      end
    end
  end

  describe '#king' do
    context 'when starting square "f5" is given' do
      it 'returns an array containing 8 possible finish squares' do
        result = moves.king('f5')
        expect(result.length).to eq(8)
      end
    end

    context 'when starting square "a1" is given' do
      it 'returns an array containing 3 possible finish squares' do
        result = moves.king('a1')
        expect(result.length).to eq(3)
      end
    end
  end

  describe '#rook' do
    context 'when starting square "d5" is given' do
      it 'returns a hash containing 14 possible finish squares in 4 directions' do
        result = moves.rook('d5')
        expect(result[:left]).to eq(%w[c5 b5 a5])
        expect(result[:right]).to eq(%w[e5 f5 g5 h5])
        expect(result[:top]).to eq(%w[d6 d7 d8])
        expect(result[:bottom]).to eq(%w[d4 d3 d2 d1])
      end
    end

    context 'when starting square "a1" is given' do
      it 'returns a hash containing 14 possible finish squares' do
        result = moves.rook('a1')
        expect(result.values.flatten.length).to eq(14)
      end
    end
  end

  describe '#rook_left' do
    context 'when given "d5" as an argument' do
      it 'returns %w[c5 b5 a5]' do
        result = moves.rook_left('d5')
        expect(result).to eq(%w[c5 b5 a5])
      end
    end
  end

  describe '#rook_right' do
    context 'when given "d5" as an argument' do
      it 'returns %w[e5 f5 g5 h5]' do
        result = moves.rook_right('d5')
        expect(result).to eq(%w[e5 f5 g5 h5])
      end
    end
  end

  describe '#rook_top' do
    context 'when given "d5" as an argument' do
      it 'returns %w[d6 d7 d8]' do
        result = moves.rook_top('d5')
        expect(result).to eq(%w[d6 d7 d8])
      end
    end
  end

  describe '#rook_bottom' do
    context 'when given "d5" as an argument' do
      it 'returns %w[d4 d3 d2 d1]' do
        result = moves.rook_bottom('d5')
        expect(result).to eq(%w[d4 d3 d2 d1])
      end
    end
  end

  describe '#bishop' do
    context 'when starting square "d4" is given' do
      it 'returns an array containing 13 possible finish squares' do
        result = moves.bishop('d4')
        expect(result.length).to eq(13)
      end
    end

    context 'when starting square "a1" is given' do
      it 'returns an array containing 7 possible finish squares' do
        result = moves.bishop('a1')
        expect(result.length).to eq(7)
      end
    end
  end

  describe '#queen' do
    context 'when starting square "d4" is given' do
      xit 'returns an array containing 27 possible finish squares' do
        result = moves.queen('d4')
        expect(result.length).to eq(27)
      end
    end
  end

  describe '#knight' do
    context 'when starting square "d5" is given' do
      it 'returns an array containing 8 possible finish squares' do
        result = moves.knight('d5')
        expect(result.length).to eq(8)
      end
    end

    context 'when starting square "a1" is given' do
      it 'returns an array containing 2 possible finish squares' do
        result = moves.knight('a1')
        expect(result.length).to eq(2)
      end
    end
  end

  describe '#pawn' do
    context 'when starting square "f2" is given for a white pawn' do
      it 'returns an array containing 2 possible finish squares' do
        result = moves.pawn('f2', 'W')
        expect(result.length).to eq(2)
      end
    end

    context 'when starting square "c4" is given for a white pawn' do
      it 'returns an array containing 1 possible finish square' do
        result = moves.pawn('c4', 'W')
        expect(result.length).to eq(1)
      end
    end
  end
end
