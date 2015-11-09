require 'test_helper'

class LogTest < ActiveSupport::TestCase
  test 'label auto creation' do
    log = Log.new title: '#tiTELING #hoBbit [smuRFing] Some title'

    assert_difference 'log.label_list.count', 3 do
      log.save
    end

    %w(titeling hobbit smurfing).each do |label_name|
      assert_includes log.label_list, label_name
    end
  end

  test 'label extraction' do
    log = Log.new title: ''

    extracted_labels = log.extract_labels('#tale-tiTELING #hoB-bit2 [smuRFing-taht-2ce] Some title')

    %w(tale-titeling hob-bit2 smurfing-taht-2ce).each do |label_name|
      assert_includes extracted_labels, label_name
    end
  end
end
