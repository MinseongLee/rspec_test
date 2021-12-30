require 'rails_helper'

RSpec.describe RandomService do
  describe '#getRandom' do
    context '랜덤 값 검증' do
      rs = RandomService.new
      it '경계 처음 값' do
        max = 0
        ran = rs.getRandom(max)
        error_message = '양의 정수를 입력해주세요'
        expect(ran).to eq(error_message)
      end

      it '경계 마지막 값' do
        max = 10000000000
        ran = rs.getRandom(max)
        error_message = '100억 미만으로 입력해주세요.'
        expect(ran).to eq(error_message)
      end

      it '매우 큰 값' do
        max = 9999999999
        ran = rs.getRandom(max)
        bool = 0 <= ran && ran < max
        expect(bool).to eq(true)
      end

      it '중간 값' do
        max = 10
        ran = rs.getRandom(max)
        bool = 0 <= ran && ran < max
        expect(bool).to eq(true)
      end

      it '음수 값' do
        max = -5
        ran = rs.getRandom(max)
        error_message = '양의 정수를 입력해주세요'
        expect(ran).to eq(error_message)
      end
    end
  end

  describe '#getZeroOrOne' do
    context '0이나 1만 나오는지 검증' do
      it '0,1을 제외한 수가 존재하지 않음' do
        rs = RandomService.new
        zero_or_one_list = []
        # 0,1을 제외한 다른 수가 있다고 가정. 즉, (2/3)^1000이 0,1을 제외한 수가 안 나올 확률
        1000.times { zero_or_one_list.push(rs.send(:getZeroOrOne)) }
        # 0,1이 아닌 다른 수가 존재하는지 확인 - difference 내부적으로 set 활용
        expect(zero_or_one_list.difference([0,1]).present?).to eq(false)
      end
    end
  end
end