class NotesController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_appointment
  before_action :set_note, only: [:edit, :update, :destroy]
  before_action :validate_note, only: [:edit, :update, :destroy]

  def index
    @notes = @appointment.notes
  end

  def new
    @note = @appointment.notes.build
  end

  def create
    @note = @appointment.notes.build(note_params)
    @note.user = current_user
    if @note.save
      redirect_to appointment_notes_path(@appointment)
    else
      render :new
    end
  end

  def edit ;end

  def update
    if @note.update(note_params)
      redirect_to appointment_notes_path(@appointment)
    else
      render :edit
    end
  end

  def destroy
    @note.destroy
    redirect_to appointment_notes_path(@appointment)
  end

  private

  def set_note
    @note = @appointment.notes.find(params[:id])
  end

  def set_appointment
    @appointment = Appointment.find params[:appointment_id]
  end

  def note_params
    params.require(:note).permit(:subject, :content)
  end

  def validate_note
    unless @note.user == current_user
      flash[:notice] = "Unauthorized access to this Patient's attachment"
      redirect_to appointment_notes_path(@appointment)
    end
  end
end
