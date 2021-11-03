require 'pry'


WIN_COMBINATIONS =[[0,1,2],[3,4,5],[6,7,8],[0,4,8],[2,4,6],[0,3,6],[1,4,7],[2,5,8]]

#board = [" "," "," "," "," "," "," "," "," "]
#binding.pry

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

# def turn_count(board)
#         counter = 1
#    while counter <= 9
#     puts counter
#       turn(board)
#       counter += 1
#    end
#end

    def turn(board)
        puts "Please enter 1-9:"
        user_input = gets.strip
        int = input_to_index(user_input)
        if valid_move?(board, int)
            move(board,int,current_player(board))
            display_board(board)
        
        else
            turn(board)
        end
        

    end
        def turn_count(board)
            count = 0
            board.each do |space|
             #binding.pry
               if space == "X" || space == "O"
                #binding.pry
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

        #puts board
        def full?(full_board)
            full_board.each do |board| 
              if board == " " 
              return false
              
              end

            end
             true
        end
          

          def draw?(board)
            # if (won?(draw_board) == false && full?(draw_board) == true)
            #   true
            # else
            #   false
            # end
            
            !won?(board) && full?(board)

          end

          def over?(board)
            if won?(board) || draw?(board)
              true
            else
              false
            end
          end

          def winner(board)
            if won?(board)
              board[won?(board)[0]]  
             end
           end

        def won?(board)

            WIN_COMBINATIONS.each do |winner|

                win_index_1 = winner[0]
                win_index_2 = winner[1]
                win_index_3 = winner[2]
          
                position_1 = board[win_index_1] 
                position_2 = board[win_index_2] 
                position_3 = board[win_index_3]
          
                if position_1 == "X" && position_2 == "X" && position_3 == "X"
                  return winner # return the win_combination indexes that won.
                end
                 if  position_1 == "O" && position_2 == "O" && position_3 == "O"
                  return winner # return the win_combination indexes that won.
                end
              end
            return false #don't use return, it stops the loop
          end

          def play(board)
            turn(board) until over?(board) 
            #draw?(board)
           if won?(board) 
            puts "Congratulations #{winner(board)}!"
           elsif draw?(board) 
            puts "Cat's Game!"
             
           end
          end
            # if winning_combo = won?(board)
            #   board[winning_combo.first]

            # end
        

          
          
          
