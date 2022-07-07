# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  setup do
    @alice = User.new(email: 'alice@sample.com', name: 'alice')
    @bob = User.new(email: 'bob@sample.com', name: 'bob')
    @report = @alice.reports.new(title: 'TDD', content: 'Test-Driven Development', created_at: '2022-04-01 10:00:00'.in_time_zone)
  end

  test 'aliceはeditable' do
    assert @report.editable?(@alice)
  end

  test 'bobはnot editable' do
    assert_not @report.editable?(@bob)
  end

  test 'aliceのcreated_on日' do
    assert_equal '2022-04-01'.to_date, @report.created_on
  end
end
