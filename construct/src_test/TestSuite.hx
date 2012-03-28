class TestSuite extends massive.munit.TestSuite
{		
	public function new()
	{
		super();
		add(persil.module.TestModule);
	}
}