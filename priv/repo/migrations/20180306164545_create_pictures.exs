defmodule Checkers.Repo.Migrations.CreatePictures do
  use Ecto.Migration

  def change do
    create table(:pictures) do
      add :name, :string

      timestamps()
    end

  end
end
