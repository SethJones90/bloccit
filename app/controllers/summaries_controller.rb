class SummariesController < ApplicationController
   def index
     @summaries = Summary.all

   end

   def new
     @summary = Summary.new

   end

   def show
     @summary = Summary.find(params[:id])
     

   end

   def edit
     @summary = Summary.find(params[:id])

   end
 
   def create
     @summary = Summary.new(params.require(:summary).permit(:name, :description))

     if @summary.save
       redirect_to @summary, notice: "Summary was saved successfully."
     else
       flash[:error] = "Error creating summary. Please try again."
       render :new
     end
   end
 
   def update
     @summary = Summary.find(params[:id])

     if @summary.update_attributes(params.require(:summary).permit(:name, :description))
       redirect_to @summary
     else
       flash[:error] = "Error saving summary. Please try again."
       render :edit
     end
   end
 end