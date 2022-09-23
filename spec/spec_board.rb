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
end
