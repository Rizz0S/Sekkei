class OrigamisController < ApplicationController

def index
    @origamis = Origami.all
end

def show
    @origami = Origami.find(params[:id])
end

def search
    @results = Origami.search(search_params)
end

private




end
