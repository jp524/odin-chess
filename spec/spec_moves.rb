# frozen_string_literal: false

require_relative '../lib/moves'

describe Moves do
  subject(:moves) {described_class.new }

  describe '#square_to_coord' do
    context 'when square "a1" is given' do
      it 'returns coordinates [0, 0]' do
        result = moves.square_to_coord('a1')
        expect(result).to eq([0, 0])
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
      it 'returns an array containing 14 possible finish squares' do
        result = moves.rook('d5')
        expect(result.length).to eq(14)
      end
    end

    context 'when starting square "a1" is given' do
      it 'returns an array containing 14 possible finish squares' do
        result = moves.rook('a1')
        expect(result.length).to eq(14)
      end
    end
  end
end