defmodule Exercise do
  def format(n), do: :io.format("~.2f~n", [n])

  def env, do: System.get_env()

  def extension(file), do: Path.extname(file)

  def work_dir, do: System.cwd()

  def execute(command), do: System.cmd(command, [])
  def execute(command, argument), do: System.cmd(command, [argument])
end
