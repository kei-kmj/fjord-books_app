# frozen_string_literal: true

require 'application_system_test_case'

class ReportsTest < ApplicationSystemTestCase
  setup do
    @report = reports(:Alice_report)

    sign_in
  end

  test 'visiting the index' do
    visit reports_url
    assert_selector 'h1', text: '日報'
    assert_text '不思議の国'
  end

  test 'creating a Report' do
    visit reports_url
    click_on '新規作成'

    fill_in 'タイトル', with: '不思議な鏡'
    fill_in '内容', with: '鏡よ鏡、鏡さん'
    click_on '登録する'

    assert_text '日報が作成されました。'
    assert_text '不思議な鏡'
    assert_text '鏡よ鏡、鏡さん'
  end

  test 'updating a Report' do
    visit reports_url
    click_on '編集'

    fill_in 'タイトル', with: '世界で一番美しいのはだれ？'
    fill_in '内容', with: 'kei-kmjです'
    click_on '更新する'

    assert_text '日報が更新されました。'
    assert_text '世界で一番美しいのはだれ？'
    assert_text 'kei-kmjです'
  end

  test 'destroying a Report' do
    visit reports_url
    page.accept_confirm do
      click_on '削除'
    end

    assert_text '日報が削除されました。'
  end

end