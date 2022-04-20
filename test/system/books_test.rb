# frozen_string_literal: true

require 'application_system_test_case'

class BooksTest < ApplicationSystemTestCase
  setup do
    @book = books(:musashi)
    sign_in
  end

  test 'visiting the index' do
    visit books_url
    assert_selector 'h1', text: '本'
    assert_text '五輪書'
  end

  test 'creating a Book' do
    visit books_url
    click_on '新規作成'

    fill_in 'メモ', with: '巌流島'
    fill_in 'タイトル', with: '五輪書'
    click_on '登録する'

    assert_text '本が作成されました。'
    assert_text '五輪書'
    click_on '戻る'
    assert_selector 'h1', text: '本'

  end

  test 'updating a Book' do
    visit books_url
    assert_text '五輪書'
    click_link '編集', match: :prefer_exact
    fill_in 'タイトル', with: '武士道'
    fill_in 'メモ', with: '武士とは'
    fill_in '著者', with: '新渡戸稲造'

    click_on '更新する'

    assert_text '本が更新されました。'
    assert_text '武士道'
    click_on '戻る'
    assert_selector 'h1', text: '本'
  end

  test 'destroying a Book' do
    visit books_url
    assert_text '五輪書'
    page.accept_confirm do
      click_link '削除', match: :first
    end

    assert_text '本が削除されました。'
    assert_no_text '五輪書'
  end
end
