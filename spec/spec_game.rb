# frozen_string_literal: false

require_relative '../lib/game'

describe Game do
  describe '#valid_start_input?' do
    subject(:game) { described_class.new }

    context "when 'P a2 a4' is given as argument" do
      it 'returns true' do
        input = 'P a2 a4'
        result = game.valid_start_input?(input)
        expect(result).to be(true)
      end
    end

    context "when 'P a2 a4' is given as argument" do
      it 'returns true' do
        input = 'B a1 a4'
        result = game.valid_start_input?(input)
        expect(result).to be(false)
      end
    end
  end
end
