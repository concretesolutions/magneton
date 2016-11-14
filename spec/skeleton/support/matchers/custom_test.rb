require_relative '../../../../lib/skeleton/features/support/matchers/custom.rb'

RSpec.describe 'custom matchers' do
    describe "these two arrays [] and []" do
        it "are empty" do
            expect([]).to have_all_elements([])
        end
    end

    describe [1,2,3] do
        it {should have_all_elements([2,1,3])}

        it { 
            expect do
                should have_all_elements([2,1])
            end.to raise_error 'expected that all elements in [1, 2, 3] is contained in [2, 1]'
        }
    end
end