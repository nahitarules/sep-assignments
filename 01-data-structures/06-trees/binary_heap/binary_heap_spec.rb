
include RSpec

require_relative 'binary_heap'

RSpec.describe BinaryHeap, type: Class do
  let (:root) { Node.new("The Matrix", 8) }

  let (:heap) { BinaryHeap.new(root) }
  let (:pacific_rim) { Node.new("Pacific Rim", 12) }
  let (:braveheart) { Node.new("Braveheart", 18) }
  let (:jedi) { Node.new("Star Wars: Return of the Jedi", 28) }
  let (:donnie) { Node.new("Donnie Darko", 38) }
  let (:inception) { Node.new("Inception", 48) }
  let (:district) { Node.new("District 9", 49) }
  let (:shawshank) { Node.new("The Shawshank Redemption", 91) }
  let (:martian) { Node.new("The Martian", 92) }
  let (:hope) { Node.new("Star Wars: A New Hope", 93) }
  let (:empire) { Node.new("Star Wars: The Empire Strikes Back", 94) }
  let (:mad_max_2) { Node.new("Mad Max 2: The Road Warrior", 98) }

  describe "#insert(data)" do
    it "properly inserts a new node as a left child" do
      heap.insert(root, pacific_rim)
      expect(root.left.title).to eq "Pacific Rim"
    end

    it "properly inserts a new node as a right child" do
      heap.insert(root, pacific_rim)
      heap.insert(root, braveheart)
      expect(root.right.title).to eq "Braveheart"
    end
  end

  describe "#find(data)" do
    it "handles nil gracefully" do
      heap.insert(root, empire)
      heap.insert(root, mad_max_2)
      expect(heap.find(root, nil)).to eq nil
    end

    it "properly finds a left node" do
      heap.insert(root, district)
      expect(heap.find(root, district.title).title).to eq "District 9"
    end

    it "properly finds a right node" do
      heap.insert(root, braveheart)
      heap.insert(braveheart, pacific_rim)
      expect(heap.find(root, braveheart.title).title).to eq "Braveheart"
    end
  end

  describe "#delete(data)" do
    it "handles nil gracefully" do
      expect(heap.delete(root, nil)).to eq nil
    end

    it "properly deletes a left node" do
      heap.insert(root, hope)
      heap.delete(root, hope.title)
      expect(heap.find(root, hope.title)).to be_nil
    end

    it "properly deletes right node" do
      heap.insert(root, pacific_rim)
      heap.insert(root, braveheart)
      heap.delete(root, braveheart.title)
      expect(heap.find(root, braveheart.title)).to be_nil
    end
  end

  describe "#print" do
    specify {
      expected_output = "The Matrix: 8\nPacific Rim: 12\nBraveheart: 18\n"

      heap.insert(root, pacific_rim)
      heap.insert(root, braveheart)

      expect { heap.print }.to output(expected_output).to_stdout
    }
 end
end
