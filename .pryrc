if defined?(PryByebug)
  Pry.commands.alias_command 'b', 'break'
  Pry.commands.alias_command 's', 'step'
  Pry.commands.alias_command 'n', 'next'
  Pry.commands.alias_command 'f', 'finish'
  Pry.commands.alias_command 'fr', 'frame'
  Pry.commands.alias_command 'c', 'continue'
  Pry.commands.alias_command 'ed', 'edit -c'
end

Pry.commands.alias_command 'bt', 'pry-backtrace'

# エンターで直前のコマンドを繰り返し実行できるようにする
Pry::Commands.command /^$/, "repeat last command" do
  _pry_.run_command Pry.history.to_a.last
end
