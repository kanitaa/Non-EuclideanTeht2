using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UIElements;

public class Noneuclidean : MonoBehaviour
{
    public float rotationSpeed;
    [SerializeField]
    GameObject firstBlock, secondBlock;

    [SerializeField]
    GameObject capsule, cube, sphere;


    void Update()
    {
        
        transform.Rotate(0, Time.deltaTime * rotationSpeed, 0);
       
        if (transform.rotation.eulerAngles.y > 70 && firstBlock.activeInHierarchy &&!sphere.activeInHierarchy)
        {
            sphere.SetActive(true);
            capsule.SetActive(false);
            Debug.Log("eka");
        }
       

        if (transform.rotation.eulerAngles.y > 174 && firstBlock.activeInHierarchy)
        {
            firstBlock.SetActive(false);
            secondBlock.SetActive(true);
            cube.SetActive(false);
            Debug.Log("toka");
            StartCoroutine("ChangeStuff");
        }

        if (transform.rotation.eulerAngles.y < 20 && transform.rotation.eulerAngles.y > 4 && secondBlock.activeInHierarchy)
        {
            Debug.Log("kolmas");
            firstBlock.SetActive(true);
            secondBlock.SetActive(false);
            cube.SetActive(true);
        }
    }
    IEnumerator ChangeStuff()
    {
        yield return new WaitForSeconds(2);
        sphere.SetActive(false);
        yield return new WaitForSeconds(1);
        //capsule.GetComponent<Renderer>().material.SetInt("_StencilRef", 1);
        capsule.SetActive(true);
    }
}
