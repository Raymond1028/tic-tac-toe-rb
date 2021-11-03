WIN_COMBINATIONS =[[0,1,2],[3,4,5],[6,7,8],[0,4,8],[2,4,6],[0,3,6],[1,4,7],[2,5,8]]

board = [" "," "," "," "," "," "," "," "," "]
def display_board(board)
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts"-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts"-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "

    
end
####

  
  
def input_to_index(input)

    puts "Please enter 1-9:"
    #input = gets.strip
    index = input.to_i - 1
end
######
def move(board,index,character) # or "O"
    board[index] = character
end
#######
def position_taken?(board, int)
 
    if board[int] == " " || board[int] == "" || board[int] == nil
        false
    elsif
       board[int]  == "X" || board[int] == "O"
        true
    end
    
end

def  valid_move?(board, int)
    
  if int < 0 || int > 9
      false
  elsif board[int] == " " || board[int] == ""
      true
  else
      false
  end 
end
    
    def turn(board)
        puts "Please enter 1-9:"
        user_input = gets
        int = input_to_index(user_input)
        if valid_move?(board, int)
            move(board,int,character = 'X')
            display_board(board)
        else
            turn(board)
        end
        

    end
        def turn_count(board1)
            count = 0
            board1.each do |space|
             #binding.pry
               if space == "X" || space == "O"
                  count += 1
               end
            end
            count
         end

        def current_player(board)
            if turn_count(board) % 2 == 0
                "X"
            else
               "O"
               
            end
        end
     

