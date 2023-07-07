class NotesController < ApplicationController
  def new
    @note = Note.new
    @stock = Stock.find(params[:stock_id])
  end

  def create
    user_stock = UserStock.where(user_id: current_user.id, stock_id: params[:note][:stock_id]).first
    note = Note.new(content: params[:note][:content], user_stock: user_stock)
    if note.save
      flash[:notice] = "Note was successfully save"
      redirect_to my_portfolio_path
    else
      flash[:alert] = "Something went wrong while trying to save the note: #{note.errors.full_messages}"
      redirect_to my_portfolio_path
    end
  end
  def edit
    @note = Note.find(params[:id])
    @stock = Stock.find(params[:stock_id])
  end

  def update
    @note = Note.find(params[:id])
    if @note.update(note_params)
      flash[:notice] = "Note was successfully updated"
      redirect_to my_portfolio_path
    else
      flash[:alert] = "Something went wrong while trying to edit the note: #{@note.errors.full_messages}"
      redirect_to my_portfolio_path
    end
  end

  def destroy
    @note = Note.find(params[:id])
    if @note.destroy
      flash[:notice] = "Note deleted successfully"
      redirect_to my_portfolio_path
    else
      flash[:alert] = "Something went wrong while trying to delete the note: #{@note.errors.full_messages}"
      redirect_to my_portfolio_path
    end
  end

  def note_params
    params.require(:note).permit(:content)
  end

end