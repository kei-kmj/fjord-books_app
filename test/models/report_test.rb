# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase

  setup do
    @alice = User.new(email: 'alice@sample.com', name: 'alice')
    @bob = User.new(email: 'bob@sample.com', name: 'bob')
    @report = @alice.reports.new(title: 'TDD', content: 'Test-Driven Development', user_id: @alice.id, created_at: '2022-04-01 10:00:00')
  end

  test 'aliceは　editable' do
    assert @report.editable?(@alice)
  end

  test 'bobは　not editable' do
    assert_not @report.editable?(@bob)
  end

  test 'aliceの　created_on 時間' do
    assert_equal '2022-04-01', @report.created_on.to_s

end
end
