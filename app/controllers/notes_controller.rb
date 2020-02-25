class NotesController < ApplicationController
  def index
    @q = current_user.notes.ransack(params[:q])
    @notes = @q.result(distinct: true).page(params[:page]).per(7)

    respond_to do |format|
      format.html
      format.csv { send_data @notes.generate_csv, filename: "notes-#{Time.zone.now.strftime('%Y%m%d%S')}.csv" }
    end
  end
  
  def show
    @note = current_user.notes.find(params[:id])
  end

  def new
    @note = Note.new
  end

  def create
    @note = current_user.notes.new(note_params)

    if @note.save
      redirect_to @note, notice: "ノート「#{@note.title}」を登録しました。"
    else
      render :new
    end
  end

  def edit
    @note = current_user.notes.find(params[:id])
  end

  def update
    note = current_user.notes.find(params[:id])
    note.update!(note_params)
    redirect_to notes_url, notice: "ノート「#{note.title}」を更新しました。"
  end

  def destroy
    note = current_user.notes.find(params[:id])
    note.destroy
    redirect_to notes_url, notice: "ノート「#{note.title}」を削除しました。"
  end

  private

  def note_params
    params.require(:note).permit(:title, :content, :maintag, :subtag1, :subtag2)
  end
end