defmodule TodoApi.Repo.Migrations.CreateTodos do
  use Ecto.Migration

  def change do
    create table(:todos, primary_key: false) do
      add :id, :uuid, primary_key: true, null: false
      add :title, :string
      add :content, :string

      timestamps(type: :utc_datetime)
    end
  end
end
