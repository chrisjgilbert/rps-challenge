feature 'result of game' do
  scenario 'user makes weapon choice' do
    sign_in_and_select_rock
    expect(page).to have_content "Chris chose rock!"
  end

  scenario 'computer makes a weapon choice' do
    allow_any_instance_of(ComputerPlayer).to receive(:choose_weapon).and_return('paper')
    sign_in_and_select_rock
    expect(page).to have_content 'The computer chose paper'
  end

  scenario 'human wins, comptuer loses' do
    allow_any_instance_of(ComputerPlayer).to receive(:choose_weapon).and_return('rock')
    sign_in_and_select_paper
    expect(page).to have_content 'Chris chose paper!'
    expect(page).to have_content 'The computer chose rock!'
    expect(page).to have_content 'Chris wins!'
  end

  scenario 'computer wins, human loses' do
    allow_any_instance_of(ComputerPlayer).to receive(:choose_weapon).and_return('scissor')
    sign_in_and_select_paper
    expect(page).to have_content 'Chris chose paper!'
    expect(page).to have_content 'The computer chose scissor!'
    expect(page).to have_content 'Computer wins!'
  end

  scenario 'human and computer select same weapon, draw' do
    allow_any_instance_of(ComputerPlayer).to receive(:choose_weapon).and_return('scissor')
    sign_in_and_select_scissor
    expect(page).to have_content 'Chris chose scissor!'
    expect(page).to have_content 'The computer chose scissor!'
    expect(page).to have_content "That's a draw!"
  end
end
