# coding: UTF-8

require File.join(File.dirname(__FILE__), "miquest.rb")
require File.join(CHIConfig::PLUGIN_PATH, "change_account", "interactive")

Plugin.create(:mikutter_adventure) {

  def ボタンが押された時の処理(押されたボタン)
    Delayer.new {
      (メッセージ, ボタン) = MikutterAdventure.ゲーム.resume(押されたボタン)

      if ボタン
        timeline(:アドベンチャー) << Message.new(system: true, message: メッセージ, confirm: ボタン, confirm_callback: lambda { |押されたボタン| ボタンが押された時の処理(押されたボタン) })
      else
        timeline(:アドベンチャー) << Message.new(system: true, message: メッセージ)
      end
    }
  end

  tab(:アドベンチャー, "みくったーアドベンチャー") {
    timeline(:アドベンチャー)

    Plugin.create(:mikutter_adventure).ボタンが押された時の処理(nil)
  }
}
