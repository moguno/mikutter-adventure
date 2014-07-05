# coding: UTF-8

require File.join(File.dirname(__FILE__), "miquest.rb")
require File.join(CHIConfig::PLUGIN_PATH, "change_account", "interactive")

Plugin.create(:mikutter_adventure) {

  def ボタンが押された時の処理(押されたボタン)
    Delayer.new {
      (メッセージ, ボタン) = MikutterAdventure.ゲーム.resume(押されたボタン)

      if ボタン
        timeline(:adventure) << Message.new(system: true, message: メッセージ, confirm: ボタン, confirm_callback: lambda { |押されたボタン| ボタンが押された時の処理(押されたボタン) })
      else
        timeline(:adventure) << Message.new(system: true, message: メッセージ)
      end
    }
  end

  def 実績(slug, description, hint=nil)
    ach_slug = :"mikutter_adv_#{slug}"
    defachievement(ach_slug,
                   description: description,
                   hidden: !hint,
                   hint: hint,
                   depends: [:tutorial]
                   ) do |ach|
      on_mikutter_adv_progress do |sequence|
        ach.take! if sequence == slug end end
  end

  tab(:adventure, "ADV") {
    set_icon(File.join(File.dirname(__FILE__), "gem.png"))
    timeline(:adventure)

    Plugin.create(:mikutter_adventure).ボタンが押された時の処理(nil)
  }

  # 実績
  実績 :start, "冒険を始めた", "宝石マークのタブを開いて、みくったーアドベンチャーをプレイしよう！"
  実績 :compass, "コンパスを見つけた", "方角が分かるアイテムがあるといいんだけど…"
  実績 :rotate_floor, "床が回ってぐるぐるする〜ｗ"
  実績 :gps, "GPSを見つけた", "現在位置が分かるアイテムがあれば楽なんだけどなぁ…"
  実績 :gem, "Gemを見つけた"
  実績 :kanabun, "カナブンを見つけた"
  実績 :good_end, "Gemを持ち帰った"
  実績 :bad_end, "Gemを持ち帰ることができなかった"

  # 歩数実績
  walk_count = gen_counter
  walk_achievements = [MikutterAdventure::WalkAchievements.new(50),
                       MikutterAdventure::WalkAchievements.new(100),
                       MikutterAdventure::WalkAchievements.new(200)]
  walk_achievements.each do |wa|
    defachievement(:"mikutter_adv_walk#{wa.count}",
                   description: "ダンジョン内を#{wa.count}歩歩いた",
                   hidden: true,
                   depends: [:tutorial]
                   ) do |ach|
      wa.achievement = ach end
  end

  on_mikutter_adv_progress do |sequence|
    if :walk == sequence
      if walk_count.call >= walk_achievements.first.count
        walk_achievements.shift.achievement.take!
      end
    end
  end

  # 上級実績
  defachievement(:mikutter_adv_item_collector,
                 description: "Mikutter Adventureの全てのアイテムを取得した",
                 hidden: true,
                 depends: %w(compass gps gem kanabun).map{|_|:"mikutter_adv_#{_}"},
                 &:take!)

  defachievement(:mikutter_adv_all_ending,
                 description: "Mikutter Adventureの全てのエンディングを見た",
                 hidden: true,
                 depends: %w(good_end bad_end).map{|_|:"mikutter_adv_#{_}"},
                 &:take!)

  defachievement(:mikutter_adv_complete,
                 description: "Mikutter Adventureの全ての実績を解除した",
                 hidden: true,
                 depends: %w(item_collector all_ending).map{|_|:"mikutter_adv_#{_}"},
                 &:take!)
}
