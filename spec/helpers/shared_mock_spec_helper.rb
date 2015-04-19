module SharedMockSpecHelper
	def stub_new_save(model:, attributes:, double:, return_value:)
		allow(model).to receive(:new).with(attributes).and_return(double)
		allow(double).to receive(:save).and_return(return_value)
	end

	def spy_new_save(model:, attributes:, double:) 
		expect(model).to have_received(:new).with(attributes)
		expect(double).to have_received(:save)
	end
end