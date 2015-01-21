# TodoistToSlack
TodoistのタスクをSlackに投げるアプリ

## Usage
1. config/config.yaml.template をコピーした、config/config.yaml を作成し、Todoist,Slackの各情報を記入
2. 本日のタスク通知に関しては、そのまま(3)を実行。本日完了タスクと明日のタスク通知は、main.rbのコメント通りにコメントアウトを外して実行する関数を切り替える
3. プロジェクトルートで ruby main.rb を実行

## 実装にあたって参考にさせてもらった記事
* written by @sinamoso129
* TodoistとTodoistAPIで、毎朝のタスク報告をするヾ(‘ω’)ﾉ
* http://mosowave.hatenablog.com/entry/2014/12/11/102432

## 動作確認環境
* ruby 2.1.1
