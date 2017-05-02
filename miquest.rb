# coding: UTF-8
  
module MikutterAdventure
  @ダンジョン =
  [
    [ :壁, :壁, :壁, :壁, :壁, :壁, :壁, :壁, :壁, :壁, :壁, :壁, :壁, :壁, :壁, :壁, :壁, :壁, :壁, :壁 ],
    [ :壁, :始, :壁, :＿, :＿, :＿, :壁, :＿, :壁, :壁, :壁, :壁, :壁, :壁, :壁, :壁, :壁, :壁, :＿, :壁 ],
    [ :壁, :＿, :壁, :＿, :壁, :＿, :＿, :＿, :壁, :壁, :壁, :壁, :壁, :＿, :＿, :e4, :壁, :終, :＿, :壁 ],
    [ :壁, :＿, :壁, :＿, :壁, :＿, :壁, :壁, :壁, :壁, :壁, :壁, :壁, :＿, :壁, :壁, :壁, :壁, :＿, :壁 ],
    [ :壁, :＿, :＿, :＿, :＿, :回, :＿, :＿, :壁, :壁, :＿, :＿, :＿, :＿, :壁, :＿, :＿, :＿, :＿, :壁 ],
    [ :壁, :＿, :壁, :＿, :壁, :＿, :壁, :壁, :＿, :壁, :＿, :壁, :壁, :壁, :壁, :壁, :壁, :壁, :＿, :壁 ],
    [ :壁, :＿, :壁, :＿, :壁, :＿, :壁, :壁, :＿, :毒, :＿, :壁, :壁, :e5, :＿, :＿, :壁, :＿, :回, :壁 ],
    [ :壁, :コ, :壁, :＿, :壁, :＿, :壁, :壁, :壁, :＿, :壁, :壁, :壁, :壁, :壁, :＿, :壁, :壁, :＿, :壁 ],
    [ :壁, :＿, :壁, :壁, :e1, :＿, :壁, :＿, :壁, :＿, :壁, :壁, :壁, :壁, :壁, :＿, :＿, :＿, :e3, :壁 ],
    [ :壁, :＿, :壁, :壁, :＿, :壁, :壁, :＿, :＿, :＿, :＿, :e2, :毒, :毒, :＿, :＿, :壁, :壁, :＿, :壁 ],
    [ :壁, :＿, :壁, :壁, :＿, :壁, :壁, :＿, :壁, :壁, :＿, :壁, :壁, :壁, :壁, :壁, :壁, :壁, :＿, :壁 ],
    [ :壁, :＿, :壁, :虫, :＿, :＿, :＿, :＿, :壁, :壁, :＿, :＿, :＿, :壁, :壁, :壁, :壁, :壁, :＿, :壁 ],
    [ :壁, :＿, :壁, :壁, :＿, :壁, :壁, :壁, :壁, :壁, :＿, :壁, :＿, :壁, :壁, :壁, :壁, :壁, :回, :壁 ],
    [ :壁, :壁, :壁, :壁, :＿, :壁, :壁, :壁, :壁, :＿, :＿, :壁, :＿, :壁, :壁, :壁, :壁, :壁, :回, :壁 ],
    [ :壁, :＿, :＿, :＿, :＿, :壁, :壁, :＿, :fv, :＿, :壁, :壁, :＿, :壁, :壁, :壁, :壁, :壁, :＿, :壁 ],
    [ :壁, :壁, :壁, :壁, :壁, :壁, :壁, :＿, :壁, :壁, :＿, :＿, :＿, :壁, :Ｇ, :壁, :毒, :毒, :＿, :壁 ],
    [ :壁, :＿, :壁, :＿, :壁, :宝, :＿, :回, :＿, :壁, :＿, :壁, :＿, :＿, :＿, :壁, :毒, :壁, :＿, :壁 ],
    [ :壁, :毒, :毒, :毒, :壁, :壁, :壁, :＿, :壁, :＿, :＿, :壁, :壁, :壁, :壁, :壁, :毒, :壁, :毒, :壁 ],
    [ :壁, :壁, :壁, :＿, :＿, :＿, :＿, :＿, :壁, :＿, :壁, :壁, :壁, :壁, :壁, :壁, :毒, :毒, :毒, :壁 ],
    [ :壁, :壁, :壁, :壁, :壁, :壁, :壁, :壁, :壁, :壁, :壁, :壁, :壁, :壁, :壁, :壁, :壁, :壁, :壁, :壁 ],
  ]
  

  # 道情報 
  RouteType = Struct.new(:種別, :直進可, :メッセージ)
  WalkAchievements = Struct.new(:count, :achievement)

  # 道
  @十字路 = RouteType.new(
    :十字路, 
    true, 
    "十字路だね。どの道にしようか？")
  
  @T字路左 = RouteType.new(
    :T路路左,
    true,
    "左側にも道があるね。どうする？")
  
  @T字路右 = RouteType.new(
    :T路路右,
    true,
    "マスター！マスター！右側にも道を見つけたよ♪")
  
  @一本道 = RouteType.new(
    :一本道,
    true,
    "一本道だね。ごーごー♪")
  
  @T字路 = RouteType.new(
    :T字路,
    false,
    "右と左に道があるね。運命の分かれ道〜")
  
  @曲がり角左 = RouteType.new(
    :曲がり角左,
    false,
    "曲がり角だね。左に道があるよ。")
  
  @曲がり角右 = RouteType.new(
    :曲がり角右,
    false,
    "突き当たり〜。右に道があるよ。")
  
  @行き止まり = RouteType.new(
    :行き止まり,
    false,
    "ありゃりゃ。行き止まりだ。戻ろうマスター。")
  
  
  def self.道情報(x, y, 向き)
    # 辺りの風景を取得
    風景 = 辺りの風景(x, y, 向き)
  
    前方 = !壁?(風景[:前方]) 
    左 = !壁?(風景[:左])
    右 = !壁?(風景[:右])
  
    道 = if 前方 && 左 && 右
      @十字路
    elsif 前方 && 左 && !右
      @T字路左
    elsif 前方 && !左 && 右
      @T字路右
    elsif 前方 && !左 && !右
      @一本道
    elsif !前方 && 左 && 右
      @T字路
    elsif !前方 && 左 && !右
      @曲がり角左
    elsif !前方 && !左 && 右
      @曲がり角右
    elsif !前方 && !左 && !右
      @行き止まり
    end
  
    道
  end
 
 

  # 方向ごとに視界の相対座標を定義
  @辺り = {
    :西 => { :前方 => { :x => -1, :y => 0 }, :左 => { :x => 0, :y => 1 }, :右 => { :x => 0, :y => -1 } },
    :東 => { :前方 => { :x => 1, :y => 0 }, :左 => { :x => 0, :y => -1 }, :右 => { :x => 0, :y => 1 } },
    :北 => { :前方 => { :x => 0, :y => -1 }, :左 => { :x => -1, :y => 0 }, :右 => { :x => 1, :y => 0 } },
    :南 => { :前方 => { :x => 0, :y => 1 }, :左 => { :x => 1, :y => 0 }, :右 => { :x => -1, :y => 0 } },
  }
  
   
  # 辺りの風景を返す
  def self.辺りの風景(x, y, 向き)
    result = {}
    pos = @辺り[向き]
    [ :前方, :左, :右 ].each { |風景|
      result[風景] = @ダンジョン[y + pos[風景][:y]][x + pos[風景][:x]]
    }
  
    result
  end
  
  
  def self.壁?(ブロック)
    壁 = [ :壁 ]
  
    壁.include?(ブロック)
  end
  

  def self.ブロック探索(ブロック)
    @ダンジョン.length.times { |y|
      @ダンジョン[y].length.times { |x|
        if @ダンジョン[y][x] == ブロック
          return [ x, y ]
        end
      }
    }
  
    raise "start not found"
  end
  
  
  def self.右を向く(向き)
    {
      :西 => :北,
      :北 => :東,
      :東 => :南,
      :南 => :西
    }[向き]
  end
  
  
  def self.左を向く(向き)
    {
      :西 => :南,
      :南 => :東,
      :東 => :北,
      :北 => :西,
    }[向き]
  end
  
  
  def self.進む(x, y, 向き)
    風景 = 辺りの風景(x, y, 向き)  
  
    if 壁?(風景[:前方])
      nil
    else
      Plugin.call :mikutter_adv_progress, :walk
      { :x => x + @辺り[向き][:前方][:x], :y => y + @辺り[向き][:前方][:y] }
    end
  end
    
  @たからもののばしょ = ブロック探索(:Ｇ)
  
  def self.イベント!(プレーヤー)
    エンディング？ = false

    ブロック = @ダンジョン[プレーヤー.y][プレーヤー.x]
  
    イベントデータ = case ブロック
  
    # 会話イベント
    when :e1
      @ダンジョン[プレーヤー.y][プレーヤー.x] = :＿

      [
        ["ねぇマスター？私たち何か忘れてる気がしない？", "そう？"],
        ["うーん、穴に落ちた時に頭とか打ったのかな？", "痛くない？"],
        ["ケガの方は大丈夫だよ。ありがとうマスター♪", "えへへ"],
      ]

    when :e2
      @ダンジョン[プレーヤー.y][プレーヤー.x] = :＿

      [
        ["そう言えば、なんで私たちGemを探してるんだっけ？", "キレイだからじゃない？"],
        ["そうだね！すごくキレイな宝石だもんね。", "ねー"],
      ]

    when :e3
      @ダンジョン[プレーヤー.y][プレーヤー.x] = :＿

      伏線イベントだよね？ = [
        ["マスター、今って何時くらいなんだろうね。", "おなかすいた・・・"],
        ["・・・なんだろう？早く帰らないといけない気がするんだ。", "ぐうぅ・・・"],
      ]

      if プレーヤー.アイテム.include?(:カナブン)
        伏線イベントだよね？ += [
          ["ちょっとマスター？なんでさっき見つけた虫を握りしめてるの？\n\nまさか！？", "非常食〜♪"],
          ["ちょちょちょ！！\n\nま、マスター？？？？\nちょっと、ちょっと落ち着こうよマスター！！\n\n早まっちゃダメ！！", "あーん"],
          ["待って待って待って待って！！\nそれだけは待って！\n\nじゃあ10秒！！！！\n10秒だけ我慢して！\n\nね！ね！\n\n私にチャンスを！！", "あーーーーーん"],
          ["キャー！！！！もうダメだ！！！！\n\nなんとか！！なんとかするのよ私！！\n\nああああああーーーーー！", "あーーーーーーーーん"],
          ["あっ！\n\nアメがあったよ！！\nアメ！アメ！アメ！！\n\nこれ食べようマスター！アメ！\n\nほらーマスター、アメちゃんだよー♪\nこっちはマスカット味であーまいよー♪♪♪\n\nこっちにしようよ！！！！\n\nね！！！！！！！\n\nマスター！！！！！！", "えー？別にいいけど・・・？"],
          ["はぁっ・・・はぁっ・・・はぁっ・・・\n\nなんとか最悪の事態は免れたよ・・・。", "むぐむぐ"],
        ]
      end

      伏線イベントだよね？
      
    when :e4
      @ダンジョン[プレーヤー.y][プレーヤー.x] = :＿

      [
        ["[ピロリロー!ニュースを更新しました!]", "！？"],
        ["あ、これはKoboだね。まだ動いてるみたいだよ。", "何か表示されてるね"],
        ["王国ニュース\n\n昨夜未明、国宝「Ruby GTK」が紛失していることが判明した。", "[more]"],
        ["テオクレス王子の王位継承式のため10年ぶりに大臣が封印を解いたところ、国宝が納められていないことに気づいたと言う。", "[more]"],
        ["当局は王宮内を全力で捜索すると共に、事情を知ると見られるメイドを逮捕し尋問を行っている。", "[EOF]"],
        ["なんだか事件が起こってるみたいだね・・・", "これNetBSD動くかな？"],
        ["[Oops! Kernel Panic!]", "あーあ、こわちゃった"],
      ]

    when :e5
      @ダンジョン[プレーヤー.y][プレーヤー.x] = :＿


      [
        ["こつん！\nカラカラカラ・・・", "！？"],
        ["なぁんだ。金属製の水筒だよ・・・あれ？手紙が入ってる。", "読む？"],
        ["おねえさんになったわたしへ\n\nきょうは\nテオくんといっぱいひみつをつくったよ", "[読む]"],
        ["でもわたしはおぼえるのがにがてなので\nひみつをおてがみにかいておきます\n\nわたしはこれをみてちゃんとおもいだしてね", "[読む]"],
        ["ひとつめ\n\nきょう\nわたしとテオくんのたからものを\nちずの[#{@たからもののばしょ[0]},#{@たからもののばしょ[1]}]においてきたよ", "[読む]"],
        ["ふたつめ\n\nテオくんがおおさまになったら\nわたしをおよめさんにしてくれるんだって（＞＜）", "[読む]"],
        ["みっつめ\n\nそれでね！テオくんは\nふたりのたからもので\nキラキラのティアラをつくってくれるの♪", "[読む]"],
        ["さいご\n\nでもこのことは\nテオくんがおおさまになるまで\nだれにもいっちゃいけないの\n\nママにもみーちゃんにもだからね！", "[読み終える]"],
        ["マスター、この子すごく可愛い♪嬉しさが伝わってくるね。", "あ、この水筒。超冷える奴だ。"],
        ["もう、マスターは本当にダメな人だね。", "！？"],
      ]

    when :虫
      @ダンジョン[プレーヤー.y][プレーヤー.x] = :＿
      プレーヤー.アイテム << :カナブン

      [
        ["[カナブンを手に入れた！]", "やったー！"],
        [->{ Plugin.call :mikutter_adv_progress, :kanabun }],
        ["えっ？ええっ！？なになに！？\n\nうわっ！マスター何その虫・・・", "非常食げっと！"],
        ["ふ・・・ふーん？\nへーそうなんだ・・・・", "ふっふー♪"],
      ]

    when :fv
      @ダンジョン[プレーヤー.y][プレーヤー.x] = :＿

      ふぁぼかせぎの恐怖 = [
        ["[ふぁぼ！]", "あはぁん・・"],
        ["あ、これはファボカセギソウだね。\n\n[ふぁぼ！]", "あはぁん・・"],
        ["この草のにおいをかぐと、一時的に社会的欲求が満たされるんだけど、\n\n[ふぁぼ！]", "あはぁん・・"],
        ["中毒性があるから近づかないでね\n\n[ふぁぼ！]", "いはぁん・・"],
        ["ってマスターひとの話聞いてない！！\n\n[ふぁぼ！]", "あふぁん・・"],
      ]

      rand(30).times { ふぁぼかせぎの恐怖 << [["[ふぁぼ！]", "[ふぁぼふぁぼ！]", "[リツイート！]"].sample, "あはぁん・・"] }

      ふぁぼかせぎの恐怖 += [
        ["うなれ鉄拳！\n\nみーちゃんパーンチ！！", "げふぅ！！"],
        ["はぁはぁ・・・危なかった。\n\nもうちょっとで本当にておくれになるとこだったよ！マスター！", "うう、ごめんなさい"],
      ]

      ふぁぼかせぎの恐怖

    # スタート地点
    when :始
      @ダンジョン[プレーヤー.y][プレーヤー.x] = :＿
  
      [
        ["どすん！", "・・・"],
        ["いったーい！あんな所に穴があったなんて・・・", "ぁぁぁぁぁぁどすーーーーん！！"],
        ["きゃあ！\nマスター！大丈夫？ちゃんと生きてる！？", "すーはーすーはーいいかおり・・・"],
        ["あ、大丈夫そう。\nいつものておくれマスターだ。", "・・・"],
        ["さぁマスター。早くGemを見つけて帰らないと日が暮れちゃうよ。\nレッツゴー！", "ちぇっ"],
        ["この周りは真っ暗だから私が手を引いてあげるね。\nマスターはどっちに行きたいか教えてね。", "りょうかい"],
        [->{ Plugin.call :mikutter_adv_progress, :start }]
      ]
  
    # ゴール地点
    when :終
      エンディング？ = true

      if プレーヤー.アイテム.include?(:Gem)
        [
          ["あ、出口だよマスター。", "出よう出よう"],
          ["わぁ・・・夕日が奇麗だねマスター\n\n・・・きゃっ！", "どしたの？"],
          ["鳥さんがGemをくわえて行っちゃった！\nせっかく苦労して見つけたのに・・・。", "あーあ"],
          ["あれ？これは手紙？", "どれどれ？"],
          [->{ Plugin.call :mikutter_adv_progress, :good_end }],
          ["「天晴れである。今回の件は全て不問とし、今後については新時代の国王に一任する。国王」\n\nだって。\nよく分かんないや", "そだね"],
          ["じゃあ、そろそろ帰ろうか。お姉ちゃんも待ってるだろうし。", "帰ろ帰ろ"],
          ["[その後色々ありましたが、みんな末永く幸せに暮らしましたとさ。]\n\nGOOD END", nil]
        ]
      else
        [
          ["あ、出口だよマスター。", "出よう出よう"],
          ["すっかり日が暮れちゃったねマスター\n\n・・・日が暮れ？\n\n・・・日没・・・まで・・・？", "・・・？"],
          ["日没まで・・・\n\nあ、私・・・忘れて・・！？\n\nいやぁぁああぁぁぁあぁあぁぁ！！！", "？？？？？"],
          [->{ Plugin.call :mikutter_adv_progress, :bad_end }],
          ["お姉ちゃん！お姉ちゃんがぁぁぁぁ！！！！\n\n・・・日没までにGemを・・王様に・・・・・処刑\n\n・・わああああああああああああ！！！", "？？？？？？？？"],
          ["[何かを思い出したみくったーちゃんは、その場で壊れてしまいましたとさ]\n\nBAD END", nil]
        ]
      end
  
    # コンパス入手
    when :コ
      プレーヤー.アイテム << :コンパス
      @ダンジョン[プレーヤー.y][プレーヤー.x] = :＿
  
      [
        ["マスター！コンパスを見つけたよ。これで今の方角が分かるね。", "やったねv"],
        [->{ Plugin.call :mikutter_adv_progress, :compass }]
      ]
  
    # GPS入手
    when :Ｇ
      プレーヤー.アイテム << :ＧＰＳ
      @ダンジョン[プレーヤー.y][プレーヤー.x] = :＿
  
      [
        ["マスター！変な機械を見つけたよ。じーぴーえす？って何？", "うはっ！持ってこう"],
        [->{ Plugin.call :mikutter_adv_progress, :gps }],
      ]
  
    # Gem入手
    when :宝
      プレーヤー.アイテム << :Gem
      @ダンジョン[プレーヤー.y][プレーヤー.x] = :＿
  
      [
        ["見つけたーーーーーーー！！！！", "びくぅっ！！"],
        [->{ Plugin.call :mikutter_adv_progress, :gem }],
        ["Gemだよマスター！Gemを見つけたよ！！", "・・・（キーン）"],
        ["目的達成だね。後は出口だけだね♪", "よし、いこう"],
      ]
  
    # 回転トラップ
    when :回
      @ダンジョン[プレーヤー.y][プレーヤー.x] = :＿
  
      プレーヤー.向き = [ :西, :東, :北, :南 ].sample
  
      [
        ["きゃー！床がぐるぐる〜〜〜！！", "のわーーーーー！"],
        [->{ Plugin.call :mikutter_adv_progress, :rotate_floor}],
        ["ふぇぇ・・・ようやく止まったけど・・・頭がクラクラするぅ・・・。", "き、気持ち悪い・・・"],
      ]
  
    else
      []
    end

    [イベントデータ, エンディング？]
  end
  
  
  def self.アイテム表示(プレーヤー)
    表示 = ""
  
    if プレーヤー.アイテム.include?(:コンパス)
      表示 += "コンパス：#{プレーヤー.向き.to_s}\n"
    end
  
    if プレーヤー.アイテム.include?(:ＧＰＳ)
      表示 += "ＧＰＳ：[#{プレーヤー.x}:#{プレーヤー.y}]\n"
    end

    if プレーヤー.アイテム.include?(:カナブン)
      表示 += "カナブン：新鮮\n"
    end
   
    表示
  end


  def self.マップ表示(プレーヤー)
    表示 = ""

    [-1, 0, 1].each { |yd|
      行 = ""

      [-1, 0, 1].each { |xd|
        行 += if プレーヤー.アイテム.include?(:コンパス) && yd == 0 && xd == 0        
          { :南 => "↓", :西 => "←", :北 => "↑", :東 => "→" }[プレーヤー.向き]
        else
          if 壁?(@ダンジョン[プレーヤー.y + yd][プレーヤー.x + xd])
            "■"
          else
            "　"
          end
        end
      }

      表示 += 行 + "\n"
    }

    表示
  end


  Player = Struct.new(:x, :y, :向き, :アイテム)

  def self.ゲーム
    @ゲーム ||= Fiber.new {
      if UserConfig[:adventure_player] 
        @プレーヤー = Player.new()

        UserConfig[:adventure_player].keys.each { |key|
          @プレーヤー[key] = UserConfig[:adventure_player][key]
        }
      else
        @プレーヤー = Player.new()
        (@プレーヤー.x, @プレーヤー.y) = ブロック探索(:始)
        @プレーヤー.向き = :南
        @プレーヤー.アイテム = []
      end

      if UserConfig[:adventure_map]
        @ダンジョン = UserConfig[:adventure_map]
      end

      loop {
        (メッセージ配列, エンディング？) = イベント!(@プレーヤー)

        if エンディング？
          UserConfig[:adventure_player] = nil
          UserConfig[:adventure_map] = nil
        end
  
        メッセージ配列.each { |メッセージ|
          case メッセージ[0]
          when Proc
            メッセージ[0].call
          when String
            if メッセージ[1]
              Fiber.yield(メッセージ[0], { メッセージ[1] => :次へ })
            else
              Fiber.yield(メッセージ[0], nil)
            end
          end
        }
  
        道 = 道情報(@プレーヤー.x, @プレーヤー.y, @プレーヤー.向き)
  
        ボタン = if 道.直進可
          {"左を向く" => :左, "直進" => :直進, "右を向く" => :右}
        else 
          {"左を向く" => :左, "右を向く" => :右}
        end
  
        押されたボタン = Fiber.yield([マップ表示(@プレーヤー) + アイテム表示(@プレーヤー) + 道.メッセージ, ボタン])
   
        case 押されたボタン
        when :右
          @プレーヤー.向き = 右を向く(@プレーヤー.向き)
        when :左
          @プレーヤー.向き = 左を向く(@プレーヤー.向き)
        when :直進
          tmp = 進む(@プレーヤー.x, @プレーヤー.y, @プレーヤー.向き)
  
          if tmp
            @プレーヤー.x = tmp[:x]
            @プレーヤー.y = tmp[:y]
          end
        end

        UserConfig[:adventure_player] = @プレーヤー.to_h
        UserConfig[:adventure_map] = @ダンジョン
      }
    }
  end
end
