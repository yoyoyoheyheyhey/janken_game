class Player
  def hand
    # コンソールを入力待ち状態にし、プレイヤーがコンソールから打ち込んだ値を出力する処理のメソッドの処理をこの中に作成する
    puts "数字を入力してください"
    puts "0: グー"
    puts "1: チョキ"
    puts "2: パー"
    gets
  end
end

class Enemy
  def hand
    # グー、チョキ、パーの値をランダムに出力するメソッドの処理をこの中に作成する
    [0, 1, 2].sample
  end
end

class Janken
  def pon(player_hand, enemy_hand)
    judge = ((player_hand.to_i - enemy_hand.to_i) + 3) % 3

    if !["0\n", "1\n", "2\n"].include?(player_hand)
      puts "0〜2の数字を入力してください"
      janken = Janken.new
      janken.pon(Player.new.hand, Enemy.new.hand)
    elsif judge ==  2
      puts "相手の手は#{Choice[enemy_hand]}です。あなたの勝ちです。"
    elsif judge == 1
      puts "相手の手は#{Choice[enemy_hand]}です。あなたの負けです。"
    else
      puts "相手の手は#{Choice[enemy_hand]}です。引き分けです。"
      janken = Janken.new
      janken.pon(Player.new.hand, Enemy.new.hand)
    end
  end
end

Choice = {0 => 'グー', 1 => 'チョキ', 2 => 'パー'}

player = Player.new
enemy = Enemy.new
janken = Janken.new

# 下記の記述で、ジャンケンメソッドが起動される
janken.pon(player.hand, enemy.hand)
