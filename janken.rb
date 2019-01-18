def rock_paper_scissors
  puts "数字を入力してください。"
  puts "0: グー\n", "1: チョキ\n", "2: パー"
  
  # 自分の手
  player_hand = gets.to_i
  # 相手の手、ランダムで決定
  program_hand = rand(3)
  
  jankens= ["グー", "チョキ", "パー"]
  puts "あなたの手:#{jankens[player_hand]},相手の手:#{jankens[program_hand]}"
  
  if (player_hand - program_hand + 3) % 3 == 2
    puts "あなたの勝ちです。"
  elsif
    (player_hand - program_hand + 3) % 3 == 1
    puts "あなたの負けです。"
  elsif player_hand == program_hand
    puts "あいこです。もう一度勝負です。"
    return true
  end
end

next_game = true 

while next_game
  next_game = rock_paper_scissors
end