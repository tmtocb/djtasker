require 'rails_helper'

describe '#routing' do 

  it 'should root page to index' do
    expect(get '/').to route_to('tasks#index')
  end

  it 'should route to index' do
    expect(get '/tasks').to route_to('tasks#index')
  end
  
  it 'should route to show' do
    expect(get 'tasks/1').to route_to('tasks#show', id: '1')
  end

end