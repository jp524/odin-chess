# frozen_string_literal: false

require_relative '../lib/board'

describe Board do
  describe '#initialize' do
    subject(:create_board) { described_class.new }

    context 'when method is called' do
      it "creates a board with the first element being 'a1'" do
        board_inst = create_board.instance_variable_get(:@board)
        expect(board_inst[0]).to eq('a1')
      end

      it "creates a board with the last element being 'h8'" do
        board_inst = create_board.instance_variable_get(:@board)
        expect(board_inst[-1]).to eq('h8')
      end

      it 'creates a board array containing 8x8 = 64 elements' do
        board_inst = create_board.instance_variable_get(:@board)
        expect(board_inst.length).to eq(64)
      end
    end
  end
end
