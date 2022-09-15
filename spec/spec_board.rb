# frozen_string_literal: false

require_relative '../lib/board'

describe Board do

  describe "create_board" do
  subject(:create_board) { described_class.new }

    context "when method is called" do
      it "creates a board with the first element being 'a1'" do
        board_inst = create_board.instance_variable_get(:@board)
        expect { create_board.create_board }.to change { board_inst[0]}.from(nil).to('a1')
      end

      it "creates a board with the last element being 'h8'" do
        board_inst = create_board.instance_variable_get(:@board)
        expect { create_board.create_board }.to change { board_inst[-1]}.from(nil).to('h8')
      end

      it "creates a board array containing 8x8 = 64 elements" do
        board_inst = create_board.instance_variable_get(:@board)
        expect { create_board.create_board }.to change { board_inst.length}.from(0).to(64)
      end
    end
  end
end