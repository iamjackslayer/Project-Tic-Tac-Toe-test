require_relative "../lib/tic_tac_toe_test.rb"
describe "Game" do 

	describe "new player" do 
		before(:all) do 
			@player = Game.new
		end

		it "returns an instance of Game" do 
			expect(@player).to be_instance_of(Game)
		end

		describe "grid" do 
			it "returns an array of arrays" do 
				expect(@player.grid).to eql([
										      ["___","___","___"],
										      ["___","___","___"],
										      ["___","___","___"]
										  ])
			end
		end

		describe "game_over" do 
			context "when win on one row" do 
				before(:all) do 
					@player.grid = [
										   	  [" x "," x "," x "],
										      ["___","___","___"],
										      ["___","___","___"]
									]
					@player.check_victory
				end
				it "returns true" do 
					expect(@player.game_over).to be_truthy
				end
			end

			context "when win on one column" do 
				before(:all) do 
					@player.grid = [
										   	  ["___","___"," x "],
										      ["___","___"," x "],
										      ["___","___"," x "]
									]
					@player.check_victory
				end
				it "returns true" do 
					expect(@player.game_over).to be_truthy
				end
			end

			context "when win diagonally" do 
				before(:all) do 
					@player.grid = [
										   	  ["___","___"," x "],
										      ["___"," x ","___"],
										      [" x ","___","___"]
									]
					@player.check_victory
				end
				it "returns true" do 
					expect(@player.game_over).to be_truthy
				end
			end
			context "when lose on one row" do 
				before(:all) do 
					@player.grid = [
										   	  [" 0 "," 0 "," 0 "],
										      ["___","___","___"],
										      ["___","___","___"]
									]
					@player.check_victory
				end
				it "returns true" do 
					expect(@player.game_over).to be_truthy
				end
			end
			context "when lose on one column" do 
				before(:all) do 
					@player.grid = [
										   	  [" 0 ","___","___"],
										      [" 0 ","___","___"],
										      [" 0 ","___","___"]
									]
					@player.check_victory
				end
				it "returns true" do 
					expect(@player.game_over).to be_truthy
				end
			end
			context "when lose diagonally" do 
				before(:all) do 
					@player.grid = [
										   	  [" 0 ","___","___"],
										      ["___"," 0 ","___"],
										      ["___","___"," 0 "]
									]
					@player.check_victory
				end
				it "returns true" do 
					expect(@player.game_over).to be_truthy
				end
			end
			context "when neither lose nor win" do 
				before(:all) do 
					@player = Game.new
					@player.grid = [
										   	  [" 0 ","___","___"],
										      ["___"," x ","___"],
										      ["___","___"," 0 "]
									]
					@player.check_victory
				end
				it "returns false" do 
					expect(@player.game_over).to be_falsey
				end
			end
		end

		describe "#ai_turn" do 
			context "when player is about to win" do 
				before(:all) do 
					@player.grid = [
										   	  [" x ","___","___"],
										      ["___","___","___"],
										      [" x ","___"," 0 "]
									]
					@player.ai_turn
				end
				it "will fill in @grid[1][0] with ' 0 '" do 
					expect(@player.grid).to eql([
											   	  [" x ","___","___"],
											      [" 0 ","___","___"],
											      [" x ","___"," 0 "]
												])
				end
			end
		end

		describe "#check_draw" do 
			context "when all positions are filled" do 
				before(:all) do 
					@player.grid = [
										   	  [" x "," 0 "," 0 "],
										      [" 0 "," x "," x "],
										      [" x "," x "," 0 "]
									]
					@player.check_draw
				end

				describe "#game_over" do 
					it "should be true" do 
						expect(@player.game_over).to be_truthy
					end
				end
			end
		end

		describe "#user_turn" do 
			context "when all positions are empty" do 
				context "when '1' is selected" do 
					before(:all) do 
						@player.grid = [
											   	  ["___","___","___"],
											      ["___","___","___"],
											      ["___","___","___"]
										]
						@player.user_choice = 1
						@player.user_turn
					end
					it "should fill the selected position with ' x '" do 
						expect(@player.grid).to eql([
												   	  [" x ","___","___"],
												      ["___","___","___"],
												      ["___","___","___"]
													])
					end
				end
			end
		end


	end


end