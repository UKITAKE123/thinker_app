class NotesController < ApplicationController
  def index
    @notes = Note.all
  end

  def show
    @note = Note.find(params[:id])
  end

  def new
    @note = Note.new
  end

  def create
    note = Note.new(note_params)
    note.save!
    redirect_to notes_url, notice: "ノート[#{note.title}]を登録しました。"
  end

  def edit
    @note = Note.find(params[:id])
  end

  def update
    note = Note.find(params[:id])
    note.update!(note_params)
    redirect_to notes_url, notice: "ノート[#{note.title}]を更新しました。"
  end

  def destroy
    note = Note.find(params[:id])
    note.destroy
    redirect_to notes_url, notice: "ノート[#{note.title}]を削除しました。"
  end

  private

  def note_params
    params.require(:note).permit(:title, :content, :maintag, :subtag1, :subtag2)
  end

end
