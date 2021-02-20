RSpec.describe AdjacencyMatrix do
  before(:each) do
    @nodes = ['A', 'B', 'C', 'D', 'E']

    @graph = WeightedGraph::PositiveWeightedGraph.new
    @graph.add_undirected_edge('A', 'B', 2)
    @graph.add_undirected_edge('B', 'C', 2)
    @graph.add_undirected_edge('C', 'D', 2)
    @graph.add_undirected_edge('A', 'D', 10)
    @graph.add_undirected_edge('B', 'E', 1)

    @matrix = AdjacencyMatrix::Matrix.new(@nodes, @graph)
  end

  it "has a version number" do
    expect(AdjacencyMatrix::VERSION).not_to be nil
  end

  context '#initialize' do
    it 'initializes based on graph' do
      expect(@matrix.matrix[0][0]).to eq(0)
      expect(@matrix.matrix[0][1]).to eq(2)
      expect(@matrix.matrix[1][2]).to eq(2)
      expect(@matrix.matrix[2][3]).to eq(2)
      expect(@matrix.matrix[0][3]).to eq(10)
      expect(@matrix.matrix[1][4]).to eq(1)
    end
  end

  context '#get' do
    it 'returns values' do
      expect(@matrix.get('A', 'A')).to eq(0)
      expect(@matrix.get('A', 'B')).to eq(2)
      expect(@matrix.get('A', 'D')).to eq(10)
      expect(@matrix.get('B', 'E')).to eq(1)
    end
  end

  context '#set' do
    it 'sets values' do
      expect(@matrix.get('A', 'D')).to eq(10)
      @matrix.set('A', 'D', 5)
      expect(@matrix.get('A', 'D')).to eq(5)
    end
  end

  context '#==' do
    it 'reports equal for same values' do
      matrix1 = AdjacencyMatrix::Matrix.new(@nodes, @graph)
      matrix2 = AdjacencyMatrix::Matrix.new(@nodes, @graph)

      expect(matrix1).to eq(matrix2)
      expect(matrix2).to eq(matrix1)
    end

    it 'reports unequal for modified cloned matrix' do
      matrix1 = AdjacencyMatrix::Matrix.new(@nodes, @graph)
      matrix2 = matrix1.clone
      matrix2.set('A', 'D', 99)

      expect(matrix1).not_to eq(matrix2)
      expect(matrix2).not_to eq(matrix1)
    end
  end

  context '#clone' do
    it 'copies values' do
      @matrix.set('A', 'D', 5)
      expect(@matrix.get('A', 'D')).to eq(5)

      copy = @matrix.clone

      expect(@matrix.get('A', 'D')).to eq(5)
      expect(copy.get('A', 'D')).to eq(5)
    end

    it 'does not modify clone when modifying original' do
      @matrix.set('A', 'D', 5)

      copy = @matrix.clone
      @matrix.set('A', 'D', 3)

      expect(@matrix.get('A', 'D')).to eq(3)
      expect(copy.get('A', 'D')).to eq(5)
    end
  end
end
