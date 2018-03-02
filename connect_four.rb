require_relative "./lib/connect_game_board.rb"
require_relative "./lib/player.rb"
require_relative "./lib/computer.rb"

class ConnectFour
  attr_reader :current_player
  COLOR = ["R", "B", "W", "P"]
  BOARD_ROWS = 7
  BOARD_COLUMNS = 6
  WIN_COMBINATION = 4
  
  def initialize
    @board = ConnectGameBoard.new BOARD_ROWS, BOARD_COLUMNS

    players_count = get_players_count

    @player1 = Player.new(player_name, select_color(COLOR), @board )

    if players_count == 1
      @player2 = Computer.new("Computer", (COLOR-[@player1.color]).sample, @board)
    else
      @player2 = Player.new(player_name(2), select_color(COLOR-[@player1.color]), @board )
    end

    @current_player = @player1
    
    execute
  end

  def execute
    loop do
      # Display the board
      @board.display

      # Ask players to make move
      @current_player.make_move

      # Check if WINNING combination is present or we are out of space
      if @board.win?( @current_player.color*WIN_COMBINATION)
        @board.display
        puts "#{@current_player.name} Wins the Game"
        exit
      elsif @board.columns_with_space.empty?
        @board.display
        puts "Game Drawn"
        exit
      end
      
      switch_turns( @current_player )
    end
  end
  
  #switching turns
  def switch_turns( current_player )
    @current_player = current_player == @player1 ? @player2 : @player1
  end

  private

  def get_players_count
    # prompt to start games and generate player/computer
    begin
      puts "How many players? Enter: 1 or 2"
      input = gets.strip.to_i
    end until input == 1 || input == 2
    return input
  end

  def player_name num = 1
    begin
      puts "Enter Name of Player # #{num}: "
      input = gets.strip.to_s
    end until !input.empty?
    
    input
  end

  def select_color color_list, num = 1
    begin
      puts "Enter Color from #{color_list.join(",")} for Player # #{num}: "
      input = gets.strip.to_s
    end until color_list.include?(input)
    
    input
  end
end