class NotesController < ApplicationController
  #creates new note
  def create
    @note = Note.new(note: params[:note], user: User.find(params[:user]))
    if @note.save #if @note is successfully created and passes valids
      redirect_to '/dashboard'
    else
      flash[:errors] = @note.errors.full_messages
      redirect_to '/dashboard'
    end
  end

  #deletes note
  def destroy
    Note.find(params[:id]).destroy
    redirect_to '/dashboard'
  end


end
