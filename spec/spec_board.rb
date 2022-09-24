# frozen_string_literal: false

require_relative '../lib/board'

describe Board do
  describe '#initialize' do
    subject(:create_board) { described_class.new }

    context 'when method is called' do
      it 'creates a board array containing 8x8 = 64 elements' do
        board_inst = create_board.instance_variable_get(:@board)
        expect(board_inst.flatten.length).to eq(64)
      end
    end
  end

  describe '#piece_exists?' do
    subject(:board) { described_class.new }

    context "when 'P' and 'a2' are given as argument" do
      it 'returns true' do
        result = board.piece_exists?('P', 'a2')
        expect(result).to be(true)
      end
    end

    context "when 'B' and 'a1' are given as argument" do
      it 'returns false' do
        result = board.piece_exists?('B', 'a1')
        expect(result).to be(false)
      end
    end
  end
end
