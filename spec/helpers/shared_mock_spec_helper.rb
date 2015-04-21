module SharedMockSpecHelper
	def stub_new_save(model:, attributes:, double:, return_value:)
		allow(model).to receive(:new).with(attributes).and_return(double)
		allow(double).to receive(:save).and_return(return_value)
	end

	def spy_new_save(model:, attributes:, double:) 
		expect(model).to have_received(:new).with(attributes)
		expect(double).to have_received(:save)
	end

	def stub_find_update(model:, id:, attributes:, double:, return_value:)
		allow(model).to receive(:find).with(id).and_return(double)
		allow(double).to receive(:update).with(attributes).and_return(return_value)
	end

	def spy_find_update(model:, id:, attributes:, double:)
		expect(Client).to have_received(:find).with(id)
		expect(double).to have_received(:update).with(attributes)
	end
end