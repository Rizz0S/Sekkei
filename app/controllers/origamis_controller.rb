class OrigamisController < ApplicationController

def index
    @origamis = Origami.all
    
end

def show
    @origami = Origami.find(params[:id])
end

def search
    @origami_titles = Origami.all.map{|origami| origami.title}
    @origami_categories = Origami.distinct.pluck(:category)
    @origami_difficulties = [1, 2, 3, 4, 5]


    render :search
end

def results
    search_terms = search_params.reject!{|search_key, search_value| search_value.empty?}
    @origamis = Origami.search(search_terms)


    render :index
end

private


def search_params
    params.permit(:title, :category, :difficulty)
end

end
