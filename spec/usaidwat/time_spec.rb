require 'spec_helper'
require 'timecop'

module USaidWat
  module Ext
    describe Integer do
      describe "#seconds" do
        it "should convert itself into seconds" do
          expect(10.seconds).to eq(10)
        end

        it "should accept a singular form of seconds" do
          expect(1.second).to eq(1)
        end

        it "should convert itself into minutes" do
          expect(10.minutes).to eq(600)
        end

        it "should accept a singular form of minutes" do
          expect(1.minute).to eq(60)
        end

        it "should convert itself into hours" do
          expect(10.hours).to eq(36_000)
        end

        it "should accept a singular form of hours" do
          expect(1.hour).to eq(3600)
        end

        it "should convert itself into days" do
          expect(10.days).to eq(864_000)
        end

        it "should accept a singular form of days" do
          expect(1.day).to eq(86_400)
        end

        it "should convert itself into weeks" do
          expect(10.weeks).to eq(6_048_000)
        end

        it "should accept a singular form of weeks" do
          expect(1.week).to eq(604_800)
        end

        it "should convert itself into years" do
          expect(10.years).to eq(315_360_000)
        end

        it "should accept a singular form of years" do
          expect(1.year).to eq(31_536_000)
        end
      end
    end

    describe Time do
      before do
        Timecop.freeze(2015, 6, 23, 17, 22, 0)
      end

      after do
        Timecop.return
      end

      describe "#seconds_ago" do
        it "returns the elapsed seconds between now and then" do
          then_ = Time.new(2015, 6, 23, 17, 21, 25)
          expect(then_.seconds_ago).to eq(35)
        end
      end

      describe "#minutes_ago" do
        it "returns the elapsed minutes between now and then" do
          then_ = Time.new(2015, 6, 23, 17, 20, 30)
          expect(then_.minutes_ago).to be_within(0.01).of(1.5)
        end
      end

      describe "#hours_ago" do
        it "returns the elapsed hours between now and then" do
          then_ = Time.new(2015, 6, 23, 13, 12)
          expect(then_.hours_ago).to be_within(0.01).of(4.16)
        end
      end

      describe "#days_ago" do
        it "returns the elapsed days between now and then" do
          then_ = Time.new(2015, 6, 18, 8, 14)
          expect(then_.days_ago).to be_within(0.01).of(5.38)
        end
      end

      describe "#weeks_ago" do
        it "returns the elapsed weeks between now and then" do
          then_ = Time.new(2015, 5, 26, 12, 14)
          expect(then_.weeks_ago).to be_within(0.01).of(4.03)
        end
      end

      describe "#months_ago" do
        it "returns the elapsed months between now and then" do
          then_ = Time.new(2013, 12, 25, 7, 49)
          expect(then_.months_ago).to be_within(0.01).of(18.17)
        end
      end

      describe "#years_ago" do
        it "returns the elapsed years between now and then" do
          then_ = Time.new(1988, 4, 1, 21, 32)
          expect(then_.years_ago).to be_within(0.01).of(27.24)
        end
      end

      describe "#ago" do
        it "should respond when then was a few seconds ago" do
          then_ = Time.now - 5
          expect(then_.ago).to eq("less than 5 seconds ago")
        end

        it "should respond when then was less than 10 seconds ago" do
          then_ = Time.now - 10
          expect(then_.ago).to eq("less than 10 seconds ago")
        end

        it "should respond when then was less than 20 seconds ago" do
          then_ = Time.now - 20
          expect(then_.ago).to eq("less than 20 seconds ago")
        end

        it "should respond when then was less than a half minute ago" do
          then_ = Time.now - 40
          expect(then_.ago).to eq("half a minute ago")
        end

        it "should respond when then was less than a minute ago" do
          then_ = Time.now - 59
          expect(then_.ago).to eq("less than a minute ago")
        end

        it "should respond when then was a minute ago" do
          then_ = Time.now - 1.minute
          expect(then_.ago).to eq("a minute ago")
        end

        it "should respond when then was several minutes ago" do
          then_ = Time.now - 45.minutes
          expect(then_.ago).to eq("45 minutes ago")
        end

        it "should respond when then was an hour ago" do
          then_ = Time.now - 90.minutes
          expect(then_.ago).to eq("about an hour ago")
        end

        it "should respond when then was several hours ago" do
          then_ = Time.now - 1440.minutes
          expect(then_.ago).to eq("about 24 hours ago")
        end

        it "should respond when then was a day ago" do
          then_ = Time.now - 2880.minutes
          expect(then_.ago).to eq("a day ago")
        end

        it "should respond when then was several days ago" do
          then_ = Time.now - 10080.minutes
          expect(then_.ago).to eq("about 7 days ago")
        end

        it "should respond when then was a week ago" do
          then_ = Time.now - 1.week - 1.minute
          expect(then_.ago).to eq("about 1 week ago")
        end

        it "should respond when then was several weeks ago" do
          then_ = Time.now - 43220.minutes
          expect(then_.ago).to eq("about 4 weeks ago")
        end

        it "should respond when then was a month ago" do
          then_ = Time.now - 43221.minutes
          expect(then_.ago).to eq("about 1 month ago")
        end

        it "should respond when then was several months ago" do
          then_ = Time.now - 180.days
          expect(then_.ago).to eq("about 6 months ago")
        end

        it "should respond when then was a year ago" do
          then_ = Time.now - 1051920.minutes
          expect(then_.ago).to eq("about a year ago")
        end

        it "should respond when then was several years ago" do
          then_ = Time.now - 1051920.minutes - 1
          expect(then_.ago).to eq("over 2 years ago")
        end
      end
    end
  end
end