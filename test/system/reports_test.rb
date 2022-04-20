# frozen_string_literal: true

require 'application_system_test_case'

class ReportsTest < ApplicationSystemTestCase
  setup do
    @report = reports(:alice)

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

    fill_in 'タイトル', with: '不思議の国'
    fill_in '内容', with: 'アリス'
    click_on '登録する'

    assert_text '日報が作成されました。'
    assert_text '不思議の国'
    assert_text 'アリス'

    click_on '戻る'
    assert_selector 'h1', text: '日報'
  end

  test 'updating a Report' do
    visit reports_url
    assert_text '不思議の国'
    click_on '編集'

    fill_in 'タイトル', with: 'ハートの女王'
    fill_in '内容', with: '王様もいる'
    click_on '更新する'

    assert_text '日報が更新されました。'
    assert_text 'ハートの女王'
    assert_text '王様もいる'
    assert_no_text '不思議の国'

    click_on '戻る'
    assert_selector 'h1', text: '日報'
  end

  test 'destroying a Report' do
    visit reports_url
    assert_text '不思議の国'
    page.accept_confirm do
      click_on '削除'
    end
    assert_text '日報が削除されました。'
    assert_no_text '不思議の国'

  end
end
