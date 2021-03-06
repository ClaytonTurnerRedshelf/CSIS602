class RockPaperScissors
  VALID=['R','P','S']
  # Exceptions this class can raise:
  class NoSuchStrategyError < StandardError 
    end

  def self.winner(player1, player2)
    raise NoSuchStrategyError, "Strategy must be one of R,P,S" unless VALID.include?(player1[1])
    raise NoSuchStrategyError, "Strategy must be one of R,P,S" unless VALID.include?(player2[1])
    if player1[1] == player2[1]
    return player1
    elsif player1[1] == 'R'
	if player2[1] == 'P'
		return player2
	else
		return player1
	end
    elsif player1[1] == 'P'
	if player2[1] == 'R'
		return player1
	else
		return player2
	end
    elsif player1[1] == 'S'
	if player2[1] == 'P'
		return player1
	else
		return player2
	end
    else
	raise "Should be Unreachable "
    end

  end

  def self.tournament_winner(tournament)
    #base case - 1 match
    if tournament[0][0].is_a? String #Checking for a name
	return self.winner(tournament[0],tournament[1])
    end
    return self.tournament_winner([self.tournament_winner(tournament[0]),self.tournament_winner(tournament[1])])
  end

end
