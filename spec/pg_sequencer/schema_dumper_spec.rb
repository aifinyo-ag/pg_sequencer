require "spec_helper"
require "support/active_record_mocks"

describe PgSequencer::SchemaDumper do
  let(:stream) { MockStream.new }
  let(:connection) { MockConnection.new(sequences) }
  let(:sequences) do
    ["user_seq", "item_seq"].map do |name|
      PgSequencer::SequenceDefinition.new(name, options)
    end
  end

  context "with all options" do
    let(:options) do
      {
        increment: 1,
        min: 1,
        max: 2_000_000,
        start: 1,
        cache: 5,
        cycle: true,
        owned_by: "table_name.column_name",
      }
    end

    it "outputs all sequences correctly" do
      MockSchemaDumper.dump(connection, stream)
      output = stream.to_s

      expect(output).to include("create_sequence")
      expect(output).to include("item_seq")
      expect(output).to include("user_seq")
      expect(output).to include("increment: 1")
      expect(output).to include("min: 1")
      expect(output).to include("max: 2000000")
      expect(output).to include("start: 1")
      expect(output).to include("cache: 5")
      expect(output).to include("cycle: true")
      expect(output).to include('owned_by: "table_name.column_name"')
    end
  end

  context "when min specified as false" do
    let(:options) do
      {
        increment: 1,
        min: false,
        max: 2_000_000,
        start: 1,
        cache: 5,
        cycle: true,
        owned_by: "table_name.column_name",
      }
    end

    it "outputs false for schema output" do
      MockSchemaDumper.dump(connection, stream)
      output = stream.to_s

      expect(output).to include("create_sequence")
      expect(output).to include("item_seq")
      expect(output).to include("user_seq")
      expect(output).to include("increment: 1")
      expect(output).to include("min: false")
      expect(output).to include("max: 2000000")
      expect(output).to include("start: 1")
      expect(output).to include("cache: 5")
      expect(output).to include("cycle: true")
      expect(output).to include('owned_by: "table_name.column_name"')
    end
  end
end
