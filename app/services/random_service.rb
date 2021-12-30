class RandomService
  # return (0 ~ max-1)
  def getRandom(max)
    begin
      raise '양의 정수를 입력해주세요' if max <= 0
      raise '100억 미만으로 입력해주세요.' if max >= 10000000000

      binary_max = max.to_s(2)
      binary = ''
      # max 2진수 숫자 개수만큼 getZeroOrOne 함수를 실행하여 binary에 추가.
      binary_max.size.times { binary.prepend(getZeroOrOne.to_s) }
      # 만약에 binary가 max 2진수 값보다 크거나 같다면 맨 앞의 숫자를 제거한 후(그 전 값) 10진수 변환을 한다.
      binary < binary_max ? binary.to_i(2).to_s(10).to_i : binary[1...binary.size].to_i(2).to_s(10).to_i
    rescue => e
      e.message
    end
  end

  private

  # 의사 난수
  def getZeroOrOne
    Random.rand(2)
  end
end
